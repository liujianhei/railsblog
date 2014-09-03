::CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = Setting.qiniu_access_key
  config.qiniu_secret_key    = Setting.qiniu_secret_key
  config.qiniu_bucket        = "liujianhong-img"
  config.qiniu_bucket_domain = "liujianhong-img.qiniudn.com"
  config.qiniu_bucket_private= true #default is false
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"

  config.upyun_username = "liujianhong"
  config.upyun_password = '*********'
  config.upyun_bucket = "blog-images"
  # upyun_bucket_domain 以后将会弃用，请改用 upyun_bucket_host
  # config.upyun_bucket_domain = "my_bucket.files.example.com"
  config.upyun_bucket_host = "http://blog-images.b0.upaiyun.com"
end
