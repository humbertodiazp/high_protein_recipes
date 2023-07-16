class IngredientsController < ApplicationController
    def destroy
        @project = Project.new(tasks: [Task.new])
    end
end
