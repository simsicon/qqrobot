module Qqrobot
  class Base

    def initialize(apid, key, product_id)
      @apid = apid
      @key = key
      @product_id = product_id
    end

    def login(qqNum, password, receiveMsgUrl)
      api_url = 'http://cloud.189works.com:8080/qqRobot/login'
      params = init_params
      params['params']['qqNum'] = qqNum
      params['params']['password'] = password
      params['params']['receiveMsgUrl'] = receiveMsgUrl


      response = RestClient.post api_url, encode_json(params), :content_type => :json, :accept => :json
      decoded_response = decode_json(response.to_s)
      puts decoded_response.inspect
    end

  private
  
    def encrypt(message, key)
      key = Base64.decode64(key)
      cipher = OpenSSL::Cipher::Cipher.new("des-ede3")
      cipher.encrypt
      cipher.key = key
      ciphertext = cipher.update(message) + cipher.final
      Base64.encode64(ciphertext).gsub(/\n/, '')
    end
    
    def encode_json(params)
      Yajl::Encoder.encode(params)
    end
    
    def decode_json(response)
      parser = Yajl::Parser.new
      hash = parser.parse(response)
      hash
    end

    def init_params
      timestamp                           = Time.now.strftime('%Y%m%d%H%M%S')
      
      params                              = {}
      params['params']                    = {}
      params['params']['apID']            = @apid
      params['params']['key']             = @key
      params['params']['productID']       = @product_id
      params['params']['timeStamp']       = timestamp
      params
    end
  end
end