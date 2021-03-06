# frozen_string_literal: true

require 'spec_helper'

describe ItemsInteractor::List do
  let(:interactor) { described_class.new }
  let(:result) { interactor.call }
  let(:repository) { ItemRepository.new }

  before do
    repository.clear
  end

  context "商品が存在しない場合" do
    it "succeeds" do
      expect(result.successful?).to be(true)
    end

    it "空配列を返す" do
      expect(result.items.length).to eq 0
    end
  end

  context "商品が存在する場合" do
    before do
      repository.create(name: 'Three Seven', price: 777)
    end

    let(:item) { repository.last }

    it "succeeds" do
      expect(result.successful?).to be(true)
    end

    it "list a Item with correct name and price" do
      expect(result.items.length).to eq 1
      expect_item = result.items[0]
      expect(expect_item.name).to eq(item.name)
      expect(expect_item.price).to eq(item.price)
    end
  end
end
