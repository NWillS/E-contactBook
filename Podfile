# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
def install_pods
    pod 'JSQMessagesViewController'
    pod 'Firebase'
    pod 'Firebase/Database'
    pod 'Alamofire'
    pod 'SwiftyJSON'
    pod 'RealmSwift'
    pod 'Alertift'
    pod "STV-Extensions"
end

target 'ContactBook' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ContactBook
  install_pods

  target 'ContactBookTests' do
    inherit! :search_paths
    # Pods for testing
    install_pods
  end

end
