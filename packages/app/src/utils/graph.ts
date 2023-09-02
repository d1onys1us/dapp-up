import { Client, cacheExchange, fetchExchange } from '@urql/svelte';

const APIURL = 'http://43.153.91.121:8000/subgraphs/name/replace_subgraph_name'
// const APIURL = 'http://localhost:8000/subgraphs/name/replace_subgraph_name'

export const client = new Client({
    url: APIURL,
    exchanges: [cacheExchange, fetchExchange],
});
