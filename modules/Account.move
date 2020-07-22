module Account {
  use 0x2::Coin;
  use 0x1::Signer;
  resource struct Account {
    coin: Coin::Coin,
  }

  public fun create_acount(signer: &signer) {
    let new_account_data = Account {
      coin: Coin::new(0)
    };
    move_to(signer, new_account_data);
  }

  public fun destroy_account(signer: &signer) acquires Account {
    let account_data = move_from<Account>(Signer::address_of(signer));
    destroy(account_data);
  }

  public fun mint_to_myself(signer: &signer, amount: u64) acquires Account {
    let my_account = borrow_global_mut<Account>(Signer::address_of(signer));
    let coin = Coin::new(amount);
    Coin::deposit(&mut my_account.coin, coin);
  }

  fun destroy(account_data: Account) {
    let Account {coin} = account_data;
    Coin::destroy(coin);
  }
}