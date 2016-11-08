require "scanii/version"
require 'rest-client'

module Scanii

  @@api_key = nil
  @@api_secret = nil

  def self.configure
    yield self
  end

  def self.new(params={})
    parameters = {}
    parameters[:api_key] = params.fetch(:api_key, api_key)
    parameters[:api_secret] = params.fetch(:api_secret, api_secret)
    Scanii::Base.new(parameters)
  end

  def self.api_key=(value)
    @@api_key = value
  end

  def self.api_key
    @@api_key
  end

  def self.api_secret=(value)
    @@api_secret = value
  end

  def self.api_secret
    @@api_secret
  end    

  class Base

    attr_accessor :api_key, :api_secret, :response, :id, :checksum, :content_length, :findings, :creation_date, :content_type, :metadata

    def self.configure
      yield self
    end

    def initialize(params={})
      raise ArgumentError.new(":api_key is a required argument to initialize Scanii") if params.fetch(:api_key).nil?
      raise ArgumentError.new(":api_secret is a required argument to initialize Scanii") if params.fetch(:api_secret).nil?
      @api_key = params.fetch(:api_key)
      @api_secret = params.fetch(:api_secret)
    end

    def scan(file)
      response = RestClient::Request.execute method: :post, url: 'https://api.scanii.com/v2.1/files', 
        user: @api_key,
        password: @api_secret,
        payload: {file: File.new(file)}
      @response = JSON(response)
      @id = @response["id"]
      @checksum = @response["checksum"]
      @content_length = @response["content_length"]
      @findings = @response["findings"]
      @creation_date = @response["creation_date"]
      @content_type = @response["content_type"]
      @metadata = @response["metadata"]
      self
    end
  end
end