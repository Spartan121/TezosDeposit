%version
1.04;
type storage = (map(address, tez), map(address, timestamp));
let%entry main = (parameter: bytes, storage: storage) => {
  let res10 =
    switch (Bytes.sub(0p, 4p, parameter)) {
    | None => failwith("Divisible by 0")
    | Some(var12) => var12
    };
  let _ = compare(0xdde2916a: bytes, res10);
  if ((0xdde2916a: bytes) == res10) {
    let pair27 = (None: option(int), None: option(tez));
    let var58_fst59 = (
                        switch (
                          1
                          * (
                              switch (Current.amount() / 0.000001tz) {
                              | None => failwith("Error with casting")
                              | Some(var38) => var38
                              }
                            )[0p]
                          / 10
                        ) {
                        | None => failwith("Divisible by 0")
                        | Some(var52) => var52
                        }
                      )[0p];

    let pair60 = (var58_fst59, (None: option(int), pair27));
    let _ = (pair60, ([]: list(operation), storage));
    if (var58_fst59 > 0) {
      ();
    } else {
      failwith("Mutez conversion not possible");
    };
    let exp86 =
      Contract.call(
        ~dest=
          switch (
            (
              Contract.at(Contract.address(Contract.self())):
                option(UnitContract.instance)
            )
          ) {
          | None => failwith("Invalid contract")
          | Some(var79) => var79
          },
        ~amount=
          (
            switch%nat (var58_fst59) {
            | Plus(var58_fst59) => var58_fst59
            | Minus(var58_fst59) => var58_fst59
            }
          )
          * 0.000001tz,
        ~parameter=(),
      );

    let cons87 = [exp86];
    let pair88 = (cons87, storage);
    let _ = (pair60, pair88);
    if (Map.mem(Current.sender(), storage[1p]) != true) {
      let update103 = Map.add(Current.sender(), Current.time(), storage[1p]);
      let storage_fst104 = storage[0p];
      let _ = (pair60, (cons87, (storage_fst104, update103)));
      let _ = (
        pair60,
        (
          cons87,
          (
            Map.add(Current.sender(), Current.amount(), storage_fst104),
            update103,
          ),
        ),
      );

      failwith("Successfully registered");
    };
    let var143_fst144 = (
                          switch (
                            (
                              Current.time()
                              - (
                                switch (
                                  Map.find(Current.sender(), storage[1p])
                                ) {
                                | None => failwith("Key not found in map")
                                | Some(var125) => var125
                                }
                              )
                            )
                            / 3600
                          ) {
                          | None => failwith("Divisible by 0")
                          | Some(var137) => var137
                          }
                        )[0p];

    let _ = ((var58_fst59, (var143_fst144, pair27)), pair88);
    let _ = compare(var143_fst144, 3600);
    if (var143_fst144 < 3600) {
      failwith("Spent time is less than 1 hour");
    };
    let var168_fst169 = (
                          switch (var143_fst144 / 3600) {
                          | None => failwith("Divisible by 0")
                          | Some(var162) => var162
                          }
                        )[0p];

    let _ = (
      (var58_fst59, (var143_fst144, (var168_fst169, None: option(tez)))),
      pair88,
    );

    let var207_snd208 = (
                          switch (
                            (
                              switch (Map.find(Current.sender(), storage[0p])) {
                              | None => failwith("Key not found in map")
                              | Some(var179) => var179
                              }
                            )
                            / (
                                switch (0 / var168_fst169) {
                                | None => failwith("Divisible by 0")
                                | Some(var190) => var190
                                }
                              )[1p]
                          ) {
                          | None => failwith("Divisible by 0")
                          | Some(var201) => var201
                          }
                        )[1p];

    let pair211 = (
      var58_fst59,
      (var143_fst144, (var168_fst169, var207_snd208)),
    );

    let _ = (pair211, pair88);
    let balance213 = Current.balance();
    let _ = compare(balance213, var207_snd208);
    if (balance213 < var207_snd208) {
      failwith("Not enough money");
    };
    let exp235 =
      Contract.call(
        ~dest=
          switch (
            (Contract.at(Current.sender()): option(UnitContract.instance))
          ) {
          | None => failwith("Invalid contract")
          | Some(var228) => var228
          },
        ~amount=var207_snd208,
        ~parameter=(),
      );

    let cons236 = [exp235, ...cons87];
    let _ = (pair211, (cons236, storage));
    let update243 = Map.add(Current.sender(), Current.time(), storage[1p]);
    let storage_fst244 = storage[0p];
    let _ = (pair211, (cons236, (storage_fst244, update243)));
    let add261 =
      (
        switch (Map.find(Current.sender(), storage_fst244)) {
        | None => failwith("Key not found in map")
        | Some(var253) => var253
        }
      )
      + Current.amount();

    let _ = Some(add261);
    let pair265 = (
      cons236,
      (Map.add(Current.sender(), add261, storage_fst244), update243),
    );

    let _ = (pair211, pair265);
    pair265;
  } else {
    failwith(400p);
  };
};
