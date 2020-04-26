require 'rspec'

describe BooksInteractor::List do
  let(:interactor) { BooksInteractor::List.new }
  let(:result) { interactor.call }
  let(:repository) { BookRepository.new }

  before do
    repository.clear
  end

  context "本が存在しない場合" do
    it "succeeds" do
      expect(result.successful?).to be(true)
    end

    it "空配列を返す" do
      expect(result.books.length).to eq 0
    end
  end

  context "本が存在する場合" do
    before do
      @book = repository.create(title: 'The Fire Next Time', author: 'James Baldwin')
    end

    it "succeeds" do
      expect(result.successful?).to be(true)
    end

    it "list a Book with correct title and author" do
      expect(result.books.length).to eq 1
      book = result.books[0]
      expect(book.title).to eq(@book.title)
      expect(book.author).to eq(@book.author)
    end
  end
end