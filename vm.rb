class VendingMachine
  # ステップ０　お金の投入と払い戻しの例コード
  # ステップ１　扱えないお金の例コード
  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze
  # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
    @sales = 0
    @stock_redbull = 5
    @stock_cola = 5
    @stock_water = 5
    @drink_status = [{name:"redbull", price:200, stock:@stock_redbull},
              {name:"cola", price:120, stock:@stock_cola},
              {name:"water", price:100, stock:@stock_water}]
  end
  def money_available
    puts "お金を投入してください"
    puts "#{MONEY}円が使用できます"
  end
  def slot_money(money)
    # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
    # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
    if MONEY.include?(money) == false
      puts "釣り銭:#{money}"
      puts "#{MONEY}円のみ使用できます"
      return false
    end
    # 自動販売機にお金を入れる
    @slot_money += money
  end
  # 投入金額の総計を取得できる。
  #タスク２ 自販機内の投入した金額の合計値をユーザにわかるように出力する
  #安達さん
  def current_slot_money
    # 自動販売機に入っているお金を表示する
    puts "投入金額は#{@slot_money}円です"
  end
  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  # 投入は複数回できる。
  #タスク1(完了) (money)に値(お金)を渡す処理を実装する
  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  # 完了
  def refund
    puts "払い戻しますか？"
    puts "1 : はい 2 : いいえ"
  end
  def return_money(refund)
    # 返すお金の金額を表示する
    if refund == 1
      puts "払い戻される金額は#{@slot_money}円です"
    # 自動販売機に入っているお金を0円に戻す
      @slot_money = 0
    else
    end
  end
  #ステップ２ジュースの管理
  #値段と名前の属性からなるジュースを１種類格納できる。初期状態で、コーラ（値段:120円、名前"コーラ"）を5本格納している。
  #格納されているジュースの情報（値段と名前と在庫）を取得できる。
  #注意：責務を持ちすぎていませんか？責任を持ちすぎていたら分割しましょう
  #タスク３ 佐々木さん
  #def juice_initialize
    #値段と名前の属性からなるジュースを１種類格納できる。初期状態で、コーラ（値段:120円、名前"コーラ"）を5本格納している。
   # @stock_redbull = 5
    #@stock_cola = 5
    #@stock_water = 5
    #@drink_status = [{name:"redbull", price:200, stock:@stock_redbull},
   #
  #タスク４ 佐々木さん
  #変動後の値を取得したい
  def juice_status
    @drink_status = [{name:"redbull", price:200, stock:@stock_redbull},
                      {name:"cola", price:120, stock:@stock_cola},
                      {name:"water", price:100, stock:@stock_water}]
    puts "商品名:レッドブル 値段:200円 在庫#{@drink_status[0][:stock]}本"
    puts "商品名:コーラ 値段:120円 在庫#{@drink_status[1][:stock]}本"
    puts "商品名:奇跡の水 値段:100円 在庫#{@drink_status[2][:stock]}本"
    puts "上記の中から選んでください。"
    puts "0:レッドブル 1:コーラ 2:奇跡の水"
    #格納されているジュースの情報（値段と名前と在庫）を取得できる。
  end
  #変数の中身チェック
  def check
    p @drink
    p @slot_money
    p @sales
  end
  #ステップ３
  #投入金額、在庫の点で、コーラが購入できるかどうかを取得できる。
  #ジュース値段以上の投入金額が投入されている条件下で購入操作を行うと、ジュースの在庫を減らし、売り上げ金額を増やす。
  #投入金額が足りない場合もしくは在庫がない場合、購入操作を行っても何もしない。
  #現在の売上金額を取得できる。
  #払い戻し操作では現在の投入金額からジュース購入金額を引いた釣り銭を出力する。
  #注意：責務が集中していませんか？責務が多すぎると思ったら分けてみましょう
  def juice_select(idx)
    if idx == 0
      @drink = @drink_status[0]
      puts "商品名:レッドブル 値段:200円 在庫#{@drink_status[0][:stock]}本"
    elsif idx == 1
      @drink = @drink_status[1]
      puts "商品名:コーラ 値段:120円 在庫#{@drink_status[1][:stock]}本"
    elsif idx == 2
      @drink = @drink_status[2]
      puts "商品名:奇跡の水 値段:100円 在庫#{@drink_status[2][:stock]}本"
    else
    end
  end
  #タスク５(完了) 宮澤
  def juice_check
    #投入金額、在庫の点で、コーラが購入できるかどうかを取得できる。
    if @slot_money >= @drink[:price] && @drink[:stock] > 0
      puts "ご購入ありがとうございます"
      true
    else
      puts "在庫#{@drink[:stock]}本"
      puts "投入金額#{@slot_money}"
      puts "購入できません"
      false
    end
  end
  #タスク６(完了) 宮澤
  def juice_buy
    #ジュース値段以上の投入金額が投入されている条件下で購入操作を行うと
    if @slot_money >= @drink[:price]
      #ジュースの在庫を減らし
      stock = @drink[:stock] - 1
      @drink[:stock] = stock
      #売り上げ金額を増やす
      @sales += @drink[:price]
      @slot_money -= @drink[:price]
      if @drink[:name] == "redbull"
        @stock_redbull = @drink[:stock]
      elsif @drink[:name] == "cola"
        @stock_cola = @drink[:stock]
      elsif @drink[:name] == "water"
        @stock_water = @drink[:stock]
      end
      #投入金額が足りない場合もしくは在庫がない場合、購入操作を行っても何もしない。
    elsif @slot_money < @drink[:price] || @drink[:stock] == 0
      # => nil
    end
  end
  #タスク７ 有田さん
  def sales
    puts ("現在の売上は#{@sales}円です。")
    #現在の売上金額を取得できる。
  end
  #タスク８ 有田さん
  def money_change
    if @slot_money == 0
      puts ("お釣りは#{@slot_money}円です。")
    else
      puts ("お釣りは#{@slot_money}円です。")
      #@slot_money = 0
    end
    #払い戻し操作では現在の投入金額からジュース購入金額を引いた釣り銭を出力する。
  end
  def purchase_confirmation
    puts "もう一度購入しますか？"
    puts "1:はい 2:いいえ"
  end
  #本当はインスタンスに対して処理を繰り返して、情報を引き継ぎたい
  def buy_again(again)
    if again == 1
      @kurikaesi=true
    else
      @kurikaesi=false
    end
  end
  # ステップ 最終
  # 全てのステップをつなげる
  def self.buy
    vending_machine = VendingMachine.new
    while @kurikaesi = true
      vending_machine.money_available
      vending_machine.slot_money(gets.to_i)
      vending_machine.current_slot_money
      vending_machine.refund
      vending_machine.return_money(gets.to_i)
      #vending_machine.juice_initialize
      vending_machine.juice_status
      vending_machine.juice_select(gets.to_i)
      vending_machine.juice_check
      vending_machine.juice_buy
      vending_machine.sales
      vending_machine.money_change
      vending_machine.purchase_confirmation
      vending_machine. buy_again(gets.to_i)
    end
    # @buy_again = true
    # while @buy_again == true
    #   @buy_again = vm
    # end
  end
end
VendingMachine.buy