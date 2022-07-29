-verbose
-keep class com.aliyun.identity.face.** {*;}
-keep class com.aliyun.identity.ocr.** {*;}
-keep class com.aliyun.identity.platform.** {*;}
-keep class com.ant.phone.xmedia.algorithm.** {*;}
-keep class xnn.** {*;}
-keep class com.alipay.zoloz.** {*;}
-keep class net.security.device.api.** {*;}

-keep class com.darsh.multipleimageselect.** { *; }
-dontwarn com.darsh.multipleimageselect.**

-keep class com.soundcloud.android.crop.** { *; }
-dontwarn com.soundcloud.android.crop.**
-keep class com.aliyun.identity.IdentityUtils {*;}
-keep class com.luck.picture.lib.** { *; }

-dontwarn com.yalantis.ucrop**
-keep class com.yalantis.ucrop** { *; }
-keep interface com.yalantis.ucrop** { *; }
