class StaticsController < ApplicationController
    before_action :authenticate_user!, except: [:top,:about]
    def top
        @cooks=Cook.all
        @rank_easies = Cook.all.sort {|a,b| b.easy <=> a.easy}.first(3)
        @rank_deliciousness= Cook.all.sort {|a,b| b.deliciousness<=> a.deliciousness}.first(3)
        render layout: false
    end
    def about
    end
end