class  CreateOrders < ActiveRecord::Migration[7.0]
        def change
          create_table :orders do |t|
            t.references :user, foreign_key: true
            t.references :item, foreign_key: true
            t.integer :price  ,null: false
            t.datetime :purchase_date
            t.decimal :purchase_price, precision: 10, scale: 2
            t.string :payment_status
            t.string :delivery_status
            t.timestamps
          end
        end
      end
    
