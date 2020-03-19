module AddressesHelper
  def fix_zipcode(zip)
    zip = zip.to_s
    three_word = zip[0..2]
    four_word = zip[3..6]
    word = [three_word, four_word].join("-")
    return word
  end
end
