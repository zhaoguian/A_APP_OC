//
//  AdaptedMacro.h
//  A_APP_OC
//
//  Created by 赵桂安 on 2018/1/16.
//  Copyright © 2018年 赵桂安. All rights reserved.
//

#ifndef AdaptedMacro_h
#define AdaptedMacro_h


#endif /* AdaptedMacro_h */


/** 屏幕尺寸 */
#define kScreenBounds [UIScreen mainScreen].bounds
#define kScreenSize [UIScreen mainScreen].bounds.size
#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kScreenH [UIScreen mainScreen].bounds.size.height
#define kOnePixel (1 / [UIScreen mainScreen].scale)

/** 屏幕比例，设计稿为750*1334 */
#define SCALE_Screen_Width (kScreenW / 375.0f)
#define SCALE_Screen_Height (kScreenH / 667.0f)

#define AdaptedWidth(x) ceilf((x) * SCALE_Screen_Width)
#define AdaptedHeight(x) ceilf((x) * SCALE_Screen_Height)

//#define AdaptedWidth(x)         ceilf((x) * (SCREEN_WIDTH>750)?kScreenWidthRatio:1.0)

/** 字体*/
#define SYS_FONT(x) [UIFont systemFontOfSize:x]
#define SYS_BOLD_FONT(x) [UIFont boldSystemFontOfSize:x]

#define SYS_AdaptedFONT(x) SYS_FONT(AdaptedWidth(x))
#define SYS_BOLD_AdaptedFONT(x) SYS_BOLD_FONT(AdaptedWidth(x))

#define Font_HelveticaRegular(x) [UIFont fontWithName:@"Helvetica" size:x]
#define Font_HelveticaRegular_Adapted(x) Font_HelveticaRegular(AdaptedWidth(x))

#pragma mark -- iOS 11 or ipone X 适配
//#define kStatusBarHeight [[UIApplication sharedApplication] statusBarFrame].size.height
//#define kNavBarHeight 44.0
//#define kTabBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height>20?83:49)
//#define kTopHeight (kStatusBarHeight + kNavBarHeight)


#define is5_8inches ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)

#define kStatusBarHeight (is5_8inches ? 44 : 20)
#define kNavBarHeight 44
#define kTopHeight (kStatusBarHeight + kNavBarHeight)

#define kTabBarHeight 49

#define kHomeIndicator 34
#define kMainAreaHeight (is5_8inches ? (kScreenH-kStatusBarHeight-kNavBarHeight-kTabBarHeight-kHomeIndicator) : (kScreenH-kStatusBarHeight-kNavBarHeight-kTabBarHeight))

#define kMainAreaHeightNoNav (is5_8inches ? (kScreenH-kTabBarHeight-kHomeIndicator) : (kScreenH-kTabBarHeight))

#define kMainAreaHeightNoTab (is5_8inches ? (kScreenH-kStatusBarHeight-kNavBarHeight-kHomeIndicator) : (kScreenH-kStatusBarHeight-kNavBarHeight))




