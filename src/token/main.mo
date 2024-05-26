import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import Debug "mo:base/Debug";

actor Token {
    var owner : Principal = Principal.fromText("h2rzf-hxwpb-mw3pk-mclxk-ak7mk-jy74w-atkvl-fsclv-cczo7-a74sz-uqe");
    var totalSupply : Nat = 1000000;
    var symbol : Text = "FUIYO";

    var balances = HashMap.HashMap<Principal, Nat>(1, Principal.equal, Principal.hash);
    balances.put(owner, totalSupply);

    public query func getBalance(who : Principal) : async Nat {
        let balance : Nat = switch (balances.get(who)) {
            case null 0;
            case (?result) result;
        };

        return balance;
    };

    public query func getSymbol() : async Text {
        return symbol;
    };

    public shared (msg) func payOut() : async Text {
        Debug.print(debug_show (msg));
        if (balances.get(msg.caller) == null) {
            let amount = 10;
            balances.put(msg.caller, amount);
            return "Success!";
        };

        return "Already Claimed";
    };

    public shared (msg) func transfer(to : Principal, amount : Nat) : async Text {
        let fromBalance = await getBalance(msg.caller);
        if (fromBalance > amount) {
            let newFromBalance : Nat = fromBalance - amount;
            balances.put(msg.caller, newFromBalance);

            let toBalance = await getBalance(to);
            let newToBalance = toBalance + amount;
            balances.put(to, newToBalance);

            return "Success";
        };

        return "Insufficient fund";
    };
};
