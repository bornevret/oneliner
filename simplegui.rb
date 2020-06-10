require_relative 'fileobserver2.rb'
require 'fox16'

include Fox

class Guibutton
    
    def initialize(app)
        super(app, "guibutton", :width=> 250, :height=>150)
        
        left_matrix = FXMatrix.new(left_matrix, "Press Button", :opts => BUTTON_NORMAL|LAYOUT_RIGHT)

        button = FXButton.new(left_matrix, "Hello", :opts => BUTTON_NORMAL|LAYOUT_RIGHT)
    end
    
    
    def create 
        super
        show(PLACEMENT_SCREEN)
    end
    
    
    app = FXApp.new
    Guibutton.new(app)
    app.create
    app.run
    
    
end