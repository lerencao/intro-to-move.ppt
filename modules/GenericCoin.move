address 0x2 {
  module GenericCoin {
    resource struct Coin<CoinType> {
      value: u64
    }
    public fun new<CoinType>(value: u64): Coin<CoinType> {
      Coin { value }
    }
    public fun value<CoinType>(coin: &Coin<CoinType>): u64 { coin.value }
    public fun deposit<CoinType>(coin: &mut Coin<CoinType>, coin2: Coin<CoinType>) {
      let Coin {value} = coin2;
      coin.value = coin.value + value;
    }
    public fun withdraw<CoinType>(coin: &mut Coin<CoinType>, value: u64): Coin<CoinType> {
      coin.value = coin.value - value;
      Coin { value }
    }
    public fun destroy<CoinType>(coin: Coin<CoinType>) {
      let Coin {value: _} = coin;
    }
  }
  }