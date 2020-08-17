# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

def import_pods
    pod 'RxSwift', '~> 4.4.0'
    pod 'RxCocoa', '~> 4.4.0'
    pod 'RxAlamofire', '~> 4.4.0'
    pod 'RealmSwift', '~> 3.17.0'
    pod 'RxRealm'
    pod 'Cartography'
end

def test_pods
    pod 'Mockingjay'
    pod 'RxBlocking', '~> 4.4.0'
    pod 'RxTest', '~> 4.4.0'
    pod 'Cuckoo', '1.4.1'
    pod 'RxSwift', '~> 4.4.0'
    pod 'RxCocoa', '~> 4.4.0'
    pod 'RxAlamofire', '~> 4.4.0'
    pod 'RxRealm'
end


target 'MobileDataApp' do
    # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
    use_frameworks!
    
    # Pods for tiles
    import_pods 

    target 'MobileDataAppTests' do
     inherit! :search_paths
     test_pods
    end   
end

post_install do |installer|

    swift4_pods = ['Mockingjay', 'URITemplate']

    installer.pods_project.targets.each do |target|

      # swift 4.2
      if swift4_pods.include?(target.name)
        target.build_configurations.each do |config|
          config.build_settings['SWIFT_VERSION'] = '4.2'
        end
      end

    end

end
