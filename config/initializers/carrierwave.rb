::CarrierWave.configure do |config|
  config.storage             = :qiniu
  config.qiniu_access_key    = "YYWZohl6D8XCKz0tgsllDcvwdL8QQyABnoHiS9cL"
  config.qiniu_secret_key    = 'tjhJA2sDDpDHve_y4ZkvBAvK6goJADkx-JSr9kew'
  config.qiniu_bucket        = "liujianhong-img"
  config.qiniu_bucket_domain = "liujianhong-img.qiniudn.com"
  config.qiniu_bucket_private= true #default is false
  config.qiniu_block_size    = 4*1024*1024
  config.qiniu_protocol      = "http"
end
