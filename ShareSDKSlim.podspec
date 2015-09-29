Pod::Spec.new do |s|
  s.name     = 'ShareSDKSlim'
  s.version  = '3.1.1'
  s.summary  = 'ShareSDK is a SNS share kit.'
  s.homepage = 'https://github.com/CodeEagle/ShareSDKSlim'
  s.author   = { 'CodeEagle' => 'lvevsany@163.com' }
  s.license  = { :type => 'Copyright', :text => <<-LICENSE
                   Copyright © 2012-2015 mob All Rights Reserved 掌淘网络 版权所有
                 LICENSE
               }
  s.source   = { :git => 'https://github.com/CodeEagle/ShareSDKSlim.git', :tag => s.version.to_s }
  s.platform     = :ios, '5.1.1'
  s.requires_arc = true

  s.default_subspec = 'Normal'

  ### Subspecs
  s.subspec 'SinaWeibo' do |sinaweibos|
    sinaweibos.requires_arc = true
    sinaweibos.dependency 'ShareSDKSlim/Core'
    sinaweibos.frameworks = 'ImageIO'
    sinaweibos.source_files   = "libraries/extends/SinaWeiboSDK/*.h"
    sinaweibos.vendored_libraries = 'libraries/extends/SinaWeiboSDK/libWeiboSDK.a'
    sinaweibos.resources = "libraries/extends/SinaWeiboSDK/WeiboSDK.bundle"
  end

  s.subspec 'WeChat' do |wechats|
    wechats.requires_arc = true
    wechats.dependency 'ShareSDKSlim/Core'
    wechats.source_files   = 'libraries/extends/WeChatSDK/WXApi.h', 'libraries/extends/WeChatSDK/WXApiObject.h'
    wechats.vendored_libraries = 'libraries/extends/WeChatSDK/libWeChatSDK.a'
  end

  s.subspec 'QQConnect' do |qqconnects|
    qqconnects.requires_arc = true
    qqconnects.dependency 'ShareSDKSlim/Core'
    qqconnects.frameworks = 'Security'
    qqconnects.libraries  = 'stdc++', 'sqlite3'
    qqconnects.vendored_frameworks = 'libraries/extends/QQSDK/TencentOpenAPI.framework'
    qqconnects.resources = "libraries/extends/QQSDK/TencentOpenApi_IOS_Bundle.bundle"
  end
  s.subspec 'Normal' do |ns|
    ns.requires_arc = true
    ns.dependency 'ShareSDKSlim/SinaWeibo'
    ns.dependency 'ShareSDKSlim/WeChat'
    ns.dependency 'ShareSDKSlim/QQConnect'
    ns.dependency 'ShareSDKSlim/UI/Flat'
  end


  s.subspec 'Core' do |cs|
    cs.requires_arc = true
    cs.frameworks = 'SystemConfiguration', 'QuartzCore', 'CoreTelephony'
    cs.libraries  = 'icucore', 'z.1.2.5'
    cs.vendored_frameworks = 'libraries/ShareSDK.framework', 'libraries/MOBFoundation.framework', 'libraries/ShareSDKConnector.framework', 'libraries/ShareSDKExtension.framework'
    cs.resources = ["libraries/ShareSDK.bundle"]
  end

  s.subspec 'UI' do |uis|
    uis.requires_arc = true
    uis.default_subspec = 'Full'

    uis.subspec 'Full' do |uifulls|
      uifulls.requires_arc = true
      uifulls.dependency 'ShareSDKSlim/UI/Flat'
    end

    uis.subspec 'Flat' do |uiflats|
      uiflats.requires_arc = true
      uiflats.vendored_frameworks = 'libraries/ShareSDKUI.framework'
      uiflats.resources = 'libraries/ShareSDKUI.bundle'
    end

  end





end
