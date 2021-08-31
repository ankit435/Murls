import axios from "axios";

import { urlDataType } from "../types";

const fetcher = axios.create({
    baseURL: "http://52.226.16.59",
    timeout: 1000,
    headers: { Authorization: "blue" },
});

export async function fetchAllUrls(): Promise<Array<urlDataType>> {
    return fetcher
        .get("/_/urls")
        .then((response) => response.data)
        .catch((e) => {
            console.log("the error while fetching all urls ", e);
            return [];
        });
}