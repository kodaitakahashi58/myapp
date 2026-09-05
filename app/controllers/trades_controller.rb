class TradesController < ApplicationController
    def index
      @trades = current_user.trades
    end    
end
