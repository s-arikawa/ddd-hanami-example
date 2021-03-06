# frozen_string_literal: true

module Web
  module Controllers
    module Books
      class Create
        include Web::Action

        expose :book

        params do
          required(:book).schema do
            required(:title).filled(:str?)
            required(:author).filled(:str?)
          end
        end

        def initialize(interactor: BooksInteractor::Create.new)
          @interactor = interactor
        end

        def call(params)
          if params.valid?
            @book = @interactor.call(params[:book])&.book

            redirect_to routes.books_path
          else
            self.status = 422
          end
        end
      end
    end
  end
end
