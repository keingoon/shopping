require 'payjp'

class MyPayJp 
  Payjp.api_key = PAYJP_SECRET_KEY
  
  # カードトークンを作成する
  def self.create_token(number, cvc, exp_month, exp_year)
    token = Payjp::Token.create({
      card: {
        number: number,
        cvc: cvc,
        exp_month: exp_month,
        exp_year: exp_year,
      }},
      {
        'X-Payjp-Direct-Token-Generate': 'true'
      }
    )
    return token.id
  end

  def self.retrieve_token(token)
    Payjp::Token.retrieve(token)
  end
 
 
end
