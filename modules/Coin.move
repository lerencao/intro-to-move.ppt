address 0x2 {
module Coin {
  resource struct Coin {
    value: u64
  }
  public fun new(value: u64): Coin {
    Coin { value }
  }
  public fun value(coin: &Coin): u64 { coin.value }
  public fun deposit(coin: &mut Coin, coin2: Coin) {
    let Coin {value} = coin2;
    coin.value = coin.value + value;
  }
  public fun withdraw(coin: &mut Coin, value: u64): Coin {
    coin.value = coin.value - value;
    Coin { value }
  }
  public fun destroy(coin: Coin) {
    let Coin {value: _} = coin;
  }
}
}