[%%version 1.03]
type storage = ((address, tez) map * (address, timestamp) map)
[%%entry
  let main (parameter : bytes) (storage : storage) =
    let res10 =
      match Bytes.sub 0p 4p parameter with
      | None  -> failwith 100p
      | Some var12 -> var12  in
    let _ = compare (0xdde2916a : bytes) res10  in
    if (0xdde2916a : bytes) = res10
    then
      let pair27 = ((None : int option), (None : tez option))  in
      let var58_fst59 =
        (match (1 *
                ((match (Current.amount ()) / 0.000001tz with
                    | None  -> failwith "Error with casting"
                    | Some var38 -> var38).(0p)))
               / 10
         with
         | None  -> failwith "Divisible by 0"
         | Some var52 -> var52).(0p)
      in
      let pair60 = (var58_fst59, ((None : int option), pair27))  in
      let _ = (pair60, (([] : operation list), storage))  in
      (if var58_fst59 > 0
       then ()
       else failwith "Mutez conversion not possible";
       (let exp86 =
          Contract.call
            ~dest:(match (Contract.at (Contract.address (Contract.self ())) : 
                            UnitContract.instance option)
                   with
                   | None  -> failwith "Invalid contract"
                   | Some var79 -> var79)
            ~amount:(([%nat
                       match var58_fst59 with
                       | Plus var58_fst59 -> var58_fst59
                       | Minus var58_fst59 -> var58_fst59])
                     * 0.000001tz) ~parameter:()
        in
        let cons87 = [exp86]  in
        let pair88 = (cons87, storage)  in
        let _ = (pair60, pair88)  in
        if (Map.mem (Current.sender ()) (storage.(1p))) <> true
        then
          (let update103 =
             Map.add (Current.sender ()) (Current.time ()) (storage.(1p))  in
           let storage_fst104 = storage.(0p)  in
           let _ = (pair60, (cons87, (storage_fst104, update103)))  in
           let _ =
             (pair60,
              (cons87,
               ((Map.add (Current.sender ()) (Current.amount ())
                   storage_fst104), update103)))
           in
           failwith "Successfully registered");
        (let var143_fst144 =
           (match ((Current.time ()) -
                   (match Map.find (Current.sender ()) (storage.(1p)) with
                    | None  -> failwith "Key not found in map"
                    | Some var125 -> var125))
                  / 3600
            with
            | None  -> failwith "Divisible by 0"
            | Some var137 -> var137).(0p)
         in
         let _ = ((var58_fst59, (var143_fst144, pair27)), pair88)  in
         let _ = compare var143_fst144 3600  in
         if var143_fst144 < 3600
         then failwith "Spent time is less than 1 hour";
         (let var168_fst169 =
            (match var143_fst144 / 3600 with
             | None  -> failwith "Divisible by 0"
             | Some var162 -> var162).(0p)
          in
          let _ =
            ((var58_fst59,
              (var143_fst144, (var168_fst169, (None : tez option)))),
             pair88)
          in
          let var207_snd208 =
            (match (match Map.find (Current.sender ()) (storage.(0p)) with
                 | None  -> failwith "Key not found in map"
                 | Some var179 -> var179) /
                   ((match 0 / var168_fst169 with
                       | None  -> failwith "Divisible by 0"
                       | Some var190 -> var190).(1p))
             with
             | None  -> failwith "Divisible by 0"
             | Some var201 -> var201).(1p)
          in
          let pair211 =
            (var58_fst59, (var143_fst144, (var168_fst169, var207_snd208)))
          in
          let _ = (pair211, pair88)  in
          let balance213 = Current.balance ()  in
          let _ = compare balance213 var207_snd208  in
          if balance213 < var207_snd208 then failwith "Not enough money";
          (let exp235 =
             Contract.call
               ~dest:(match (Contract.at (Current.sender ()) : UnitContract.instance
                                 option)
                      with
                      | None  -> failwith "Invalid contract"
                      | Some var228 -> var228) ~amount:var207_snd208
               ~parameter:()
           in
           let cons236 = exp235 :: cons87  in
           let _ = (pair211, (cons236, storage))  in
           let update243 =
             Map.add (Current.sender ()) (Current.time ()) (storage.(1p))  in
           let storage_fst244 = storage.(0p)  in
           let _ = (pair211, (cons236, (storage_fst244, update243)))  in
           let add261 =
             (match Map.find (Current.sender ()) storage_fst244 with
              | None  -> failwith "Key not found in map"
              | Some var253 -> var253) + (Current.amount ())
           in
           let _ = Some add261  in
           let pair265 =
             (cons236,
              ((Map.add (Current.sender ()) add261 storage_fst244),
               update243))
           in
           let _ = (pair211, pair265)  in pair265)))))
    else failwith 400p ]
