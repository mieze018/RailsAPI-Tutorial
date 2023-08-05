require 'rails_helper'

RSpec.describe "Api::V1::Healthchecks", type: :request do
  describe "GET /api/v1/healthchecks" do
    subject(:send_request) { get "/api/v1/healthchecks" }

    it "returns http success" do
      expect(send_request).to eq 200
      # symbolize_namesはJSON.#parseのoptionでこれを指定するとparse結果として出力するhashの引数をシンボルで返してくれます。
      # これを使用しない場合は、該当行を下記のように書き換える必要があります。
      # expect(JSON.parse(response.body)).to match({ "result" => 'ok' })
      expect(JSON.parse(response.body, symbolize_names: true)).to match({ request: "ok" })
    end
  end
end
