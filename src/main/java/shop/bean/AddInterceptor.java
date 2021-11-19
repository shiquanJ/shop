package shop.bean;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import shop.filter.LoginInterceptor;

@Configuration
public class AddInterceptor implements WebMvcConfigurer{
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/**").addResourceLocations("classpath:/META-INF/resources/" ,"classpath:/resources/","classpath:/static/","classpath:/public/","/");
	}
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		//项目启动时加载这个inteceptor拦截器， "/login","/assets/**","/error"这些事排除的
		registry.addInterceptor(new LoginInterceptor()).addPathPatterns("/**").excludePathPatterns("/login","/assets/**","/error");
	}

}
