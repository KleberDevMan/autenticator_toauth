class MyFinanceService
  attr_reader :authentication_token, :account_id, :base_url

  def initialize(authentication_token, account_id)
    @authentication_token = authentication_token
    @account_id = account_id
    @base_url = 'https://app.myfinance.com.br'
  end

  def authorization_hash
    Base64.strict_encode64(@authentication_token)
  end

  def headers
    {
        'Accept': 'application/json',
        'Content-type': 'application/json',
        'ACCOUNT_ID': @account_id,
        'Authorization': "Basic #{authorization_hash}:X"
    }
  end

  def entities
    url = @base_url + '/entities'
    RestClient::Resource.new(url, {headers: headers})
  end

  def parse(request)
    JSON.parse(request.body)
  end
end