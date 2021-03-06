# frozen_string_literal: true

require 'hanami/interactor'

module BooksInteractor
  class Create
    include Hanami::Interactor

    expose :book

    def initialize(repository: BookRepository.new)
      @repository = repository
    end

    def call(book_attributes)
      @book = @repository.create(book_attributes)
    end
  end
end
