require 'net/http'
require 'uri'
require 'json'

module Translation
  class << self
    def translate_to_japanese(context)
      url = URI.parse('https://www.googleapis.com/language/translate/v2')
      params = {
          q: context,
          target: "ja", # 翻訳したい言語
          source: "en", # 翻訳する言語の種類
          key: ENV['GOOGLE_API_KEY']
      }
      url.query = URI.encode_www_form(params)
      res = Net::HTTP.get_response(url)
      json = res.body
      # レスポンスのjsonの言語の翻訳結果の部分のパラメータをパースする
      "#{JSON.parse(json)["data"]["translations"].first["translatedText"]}"
    end
  end
end