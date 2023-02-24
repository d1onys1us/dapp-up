import type { Chain } from "@wagmi/core";

export const taiko = {
  id: 167001,
  name: "Taiko",
  network: "Askja (Alpha-2)",
  nativeCurrency: {
    decimals: 18,
    name: "Ether",
    symbol: "ETH",
  },
  rpcUrls: {
    public: {
      http: ["https://l2rpc.internal.taiko.xyz"],
    },
    default: {
      http: ["https://l2rpc.internal.taiko.xyz"],
    },
  },
  blockExplorers: {
    default: {
      name: "L2 Explorer",
      url: "https://l2explorer.internal.taiko.xyz",
    },
  },
} as const satisfies Chain;

export const anvil = {
  id: 31337,
  name: "Anvil",
  network: "Anvil (localhost)",
  nativeCurrency: {
    decimals: 18,
    name: "Ether",
    symbol: "ETH",
  },
  rpcUrls: {
    public: {
      http: ["http://localhost:8545"],
    },
    default: {
      http: ["http://localhost:8545"],
    },
  },
} as const satisfies Chain;

export const base = {
  id: 84531,
  name: "Base Goerli",
  network: "Base Goerli",
  nativeCurrency: {
    decimals: 18,
    name: "Ether",
    symbol: "ETH",
  },
  rpcUrls: {
    public: {
      http: ["https://goerli.base.org"],
    },
    default: {
      http: ["https://goerli.base.org"],
    },
  },
} as const satisfies Chain;
