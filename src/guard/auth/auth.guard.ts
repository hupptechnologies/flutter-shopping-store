import { CanActivate, ExecutionContext, Injectable, UnauthorizedException } from '@nestjs/common';
import { Reflector } from '@nestjs/core';
import { JwtService } from '@nestjs/jwt';
import { Request, Response } from 'express';
import { Observable } from 'rxjs';
import { KeyConstant } from 'src/common/constant/key.constant';
import { JWTPayload } from 'src/common/interface/jwt.interface';
import { PUBLIC_KEY } from 'src/decorator/public/public.decorator';
import { UserRepository } from 'src/module/user/user.repository';

@Injectable()
export class AuthGuard implements CanActivate {
	constructor(
		private reflector: Reflector,
		private jwtService: JwtService,
		private userRepository: UserRepository,
	) {}

	canActivate(context: ExecutionContext): boolean | Promise<boolean> | Observable<boolean> {
		const isPublic = this.isPublicRoute(context);

		if (isPublic) {
			return true;
		}

		const { request, response, accessToken, refreshToken } = this.getTokensFromContext(context);

		if (!accessToken && refreshToken) {
			return this.refreshAccessToken(refreshToken, response, request);
		}

		return this.verifyAccessToken(accessToken, refreshToken, response, request);
	}

	private isPublicRoute(context: ExecutionContext): boolean {
		return this.reflector.getAllAndOverride<boolean>(PUBLIC_KEY, [
			context.getHandler(),
			context.getClass(),
		]);
	}

	private getTokensFromContext(context: ExecutionContext): {
		request: Request;
		response: Response;
		accessToken: string;
		refreshToken: string;
	} {
		const request = context.switchToHttp().getRequest<Request>();
		const response = context.switchToHttp().getResponse<Response>();
		const cookies: Record<string, string> = request.cookies;
		return {
			request,
			response,
			accessToken: cookies[KeyConstant.ACCESS_TOKEN],
			refreshToken: cookies[KeyConstant.REFRESH_TOKEN],
		};
	}

	private refreshAccessToken(
		refreshToken: string,
		response: Response,
		request: Request,
	): Promise<boolean> {
		const { accessToken, id } = this.generateAccessTokenFromRefreshToken(refreshToken);
		response.cookie(KeyConstant.ACCESS_TOKEN, accessToken, {
			httpOnly: true,
			maxAge: KeyConstant.ACCESS_TOKEN_MAX_AGE,
		});
		return this.findByIdUser(id, request);
	}

	private generateAccessTokenFromRefreshToken(token: string): {
		id: number;
		accessToken: string;
	} {
		try {
			const { id, userName, email } = this.jwtService.verify<JWTPayload>(token);
			const accessToken = this.jwtService.sign({
				id,
				userName,
				email,
			});
			return {
				id,
				accessToken,
			};
		} catch {
			throw new UnauthorizedException();
		}
	}

	private verifyAccessToken(
		accessToken: string,
		refreshToken: string,
		response: Response,
		request: Request,
	): Promise<boolean> {
		if (!accessToken) {
			throw new UnauthorizedException();
		}

		try {
			const { id } = this.jwtService.verify<JWTPayload>(accessToken);
			return this.findByIdUser(id, request);
		} catch (error) {
			const err = error as Error;
			if (err.name === 'TokenExpiredError' && refreshToken) {
				return this.refreshAccessToken(refreshToken, response, request);
			}
			throw new UnauthorizedException();
		}
	}

	private async findByIdUser(id: number, request: Request): Promise<boolean> {
		const user = await this.userRepository.findOneById(id);

		if (!user) {
			throw new UnauthorizedException();
		}

		request.user = user;
		return true;
	}
}
