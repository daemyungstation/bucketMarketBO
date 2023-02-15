package common.annotation;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * <pre>
 * @PackageName: common.annotation
 * @FileName : RequestParams.java
 * @Date : 2020. 2. 10.
 * @프로그램 설명 : Request 파라메터 Annotation Class
 * @author upleat
 * </pre>
 */
@Documented
@Target(ElementType.PARAMETER)
@Retention(RetentionPolicy.RUNTIME)
public @interface RequestParams {
    String value() default "";
}
