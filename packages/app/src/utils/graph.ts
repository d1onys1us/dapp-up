import { Client, cacheExchange, fetchExchange } from '@urql/svelte';

const APIURL = ' http://43.153.69.251:8000/subgraphs/name/taiko/diamondsNFT'

export const client = new Client({
    url: APIURL,
    exchanges: [cacheExchange, fetchExchange],
});
