class OrderHistry < ApplicationRecord
    
  enum production_status: {
          着手不可:0,#着手不可
          制作待ち:1,#制作待ち
          制作中:2,#制作中
          制作完了:3,}#制作
    
    belongs_to :order
    belongs_to :item
    
    
end
