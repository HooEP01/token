import type { Principal } from '@dfinity/principal';
export interface _SERVICE {
  'getBalance' : (arg_0: Principal) => Promise<bigint>,
  'getSymbol' : () => Promise<string>,
}
