::CarrierWave.configure do |config|
  config.storage             = :upyun
  config.qiniu_access_key    = Setting.qiniu_access_key
  config.qiniu_secret_key    = Setting.qiniu_secret_key
  config.qiniu_bucket        = "liujianhong-img"
  config.qiniu_bucket_domain = "liujianhong-img.qiniudn.com"
  config.qiniu_bucket_private= true #default is false
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"

#  config.upyun_username = Setting.upyun_username
#  config.upyun_password = Setting.upyun_password
  config.upyun_bucket = "blog-images"
  # upyun_bucket_domain 以后将会弃用，请改用 upyun_bucket_host
  # config.upyun_bucket_domain = "my_bucket.files.example.com"
  config.upyun_bucket_host = "http://blog-images.b0.upaiyun.com"
#  config.aliyun_access_id = Setting.aliyun_access_id
#  config.aliyun_access_key = Setting.aliyun_access_key
  # 你需要在 Aliyum OSS 上面提前创建一个 Bucket
  config.aliyun_bucket = "blog-images"
  # 是否使用内部连接，true - 使用 Aliyun 局域网的方式访问  false - 外部网络访问
  config.aliyun_internal = false
  # 配置存储的地区数据中心，默认: cn-hangzhou
  # config.aliyun_area = "cn-hangzhou" 
  # 使用自定义域名，设定此项，carrierwave 返回的 URL 将会用自定义域名
  # 自定于域名请 CNAME 到 you_bucket_name.oss.aliyuncs.com (you_bucket_name 是你的 bucket 的名称)
  config.aliyun_host = "blog-images.oss-cn-hangzhou.aliyuncs.com" 

  config.fog_credentials = {
    :provider               => 'AWS',                        # required
    :aws_access_key_id      => Setting.aws_access_key_id,                        # required
    :aws_secret_access_key  => Setting.aws_secret_access_key,                        # required
#    :region                 => 'Singapore',                  # optional, defaults to 'us-east-1'
#    :host                   => 's3-website-ap-southeast-1.amazonaws.com',             # optional, defaults to nil
#    :endpoint               => 'liujianhongblog-images.s3-website-ap-southeast-1.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'liujianhongblog-images'                     # required
  config.fog_public     = false                                   # optional, defaults to true
  config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
end
