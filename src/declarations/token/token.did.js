export const idlFactory = ({ IDL }) => {
  return IDL.Service({
    'getBalance' : IDL.Func([IDL.Principal], [IDL.Nat], ['query']),
  });
};
export const init = ({ IDL }) => { return []; };