module Api
  module V1
    # This controller handles CRUD operations for Todo resources.
    class TodosController < ApplicationController
      before_action :set_todo, only: [:show, :update, :destroy]
      def index
        @todos = Todo.all
        render status: :ok, json: @todos
      end

      def show
        render status: :ok, json: @todo
      end

      def create
        todo = Todo.new(todo_params)
        if todo.save
          render status: :created
        else
          render status: :unprocessable_entity
        end
      end

      def update
        if @todo.update(todo_params)
          render status: :accepted
        else
          render status: :unprocessable_entity
        end
      end

      def destroy
        @todo.destroy
        render status: :accepted
      end

      private

      # Sets the @todo instance variable based on the id parameter
      def set_todo
        @todo = Todo.find(params[:id])
      end

      # Defines the allowed parameters for creating or updating a todo
      def todo_params
        params.require(:todo).permit(:content)
      end
    end
  end
end
