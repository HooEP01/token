import ReactDOM from "react-dom";
import React from "react";
import App from "./components/App";
import { AuthClient } from "@dfinity/auth-client/lib/cjs/index";

const init = async () => {
  const authClient = await AuthClient.create();

  if (await authClient.isAuthenticated) {
    console.log("Logged in");
  }

  await authClient.login({
    identityProvider: "https://identity.ic0.app/#authorize",
    onSuccess: () => {
      handleAuthenticated(AuthClient);
    },
  });
};

async function handleAuthenticated(authClient) {
  const identity = await authClient.getIdentity();
  const userPrinciple = identity._principal.toString();
  console.log(userPrinciple);
  ReactDOM.render(<App loggedInPrinciple={userPrinciple}/>, document.getElementById("root"));
}
init();
