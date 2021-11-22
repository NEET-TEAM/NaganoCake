class OrderHistry < ApplicationRecord
    
  enum production_status: {
          not_startable:0,#着手不可
          waiting_for_production:1,#制作待ち
          under_production:2,#制作中
          completed:3,}#制作
    
    
    
end
