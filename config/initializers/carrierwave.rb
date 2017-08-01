CarrierWave.configure do |config|
  config.storage    = :aws
  config.aws_bucket = ENV['_FIGARO_S3_BUCKET_NAME']
  config.aws_acl    = 'public-read'
  # The maximum period for authenticated_urls is only 7 days.
  config.aws_authenticated_url_expiration = 60 * 60 * 24 * 7

  # Set custom options such as cache control to leverage browser caching
  config.aws_attributes = {
    expires: 1.week.from_now.httpdate,
    cache_control: 'max-age=604800'
  }
  config.aws_credentials = {
    access_key_id:     ENV['_FIGARO_AWS_Access_Key_Id'],
    secret_access_key: ENV['_FIGARO_AWS_Secret_Key'],
    region:            ENV['_FIGARO_AWS_REGION'] # Required
  }
  byebug
  # Optional: Signing of download urls, e.g. for serving private content through
  # CloudFront. Be sure you have the `cloudfront-signer` gem installed and
  # configured:
  # config.aws_signer = -> (unsigned_url, options) do
  #   Aws::CF::Signer.sign_url(unsigned_url, options)
  # end
end