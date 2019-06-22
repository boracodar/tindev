module Api
  module V1
    class ProgrammingLanguagesController < ApplicationController
      def index
        render json: ProgrammingLanguage.order(:release_year)
      end

      def show
        render json: ProgrammingLanguage.find(params[:id])
      end

      def create
        programming_language = ProgrammingLanguage.new(programming_language_params)

        if programming_language.save # happy path
          render json: programming_language, status: :created # 201
        else # failure path
          render json: { errors: programming_language.errors.full_messages },
            status: :bad_request # 400
        end
      end

      def update
        programming_language = ProgrammingLanguage.find(params[:id])

        if programming_language.update(programming_language_params)
          render json: programming_language, status: :accepted
        else
          render json: { errors: programming_language.errors.full_messages },
            status: :bad_request # 400
        end
      end

      def destroy
        programming_language = ProgrammingLanguage.find(params[:id])

        if programming_language.destroy
          render json: programming_language, status: :accepted
        else
          render json: { errors: programming_language.errors.full_messages },
            status: :bad_request # 400
        end
      end

      private

      def programming_language_params
        params.require(:programming_language)
          .permit(:name, :creator, :release_year)
      end
    end
  end
end
