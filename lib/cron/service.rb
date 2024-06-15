require 'net/http'
require 'uri'
require 'json'

module Cron
  class Service
    CRON_URL = 'http://localhost:8080/api/v1'.freeze

    def list(user_id)
      url = uri("jobs?user_id=#{user_id}")
      request = Net::HTTP::Get.new(url)

      call(url, request)
    end

    def create(params)
      url = uri('jobs')
      request = Net::HTTP::Post.new(url)
      request.body = params

      call(url, request)
    end

    private

    def call(uri, request)
      request.content_type = 'application/json'
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https'

      response = http.request(request)

      raise "Error while performing #{uri}" unless response.is_a? Net::HTTPSuccess

      JSON.parse(response.body)
    end

    def uri(path)
      URI.parse("#{CRON_URL}/#{path}")
    end
  end
end
