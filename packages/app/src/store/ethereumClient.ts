import { writable } from "svelte/store";
import type { EthereumClient } from "@web3modal/ethereum";
export const ethereumClient = writable<EthereumClient>();
