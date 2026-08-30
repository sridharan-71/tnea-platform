"use client";

import { useEffect, useState } from "react";

export interface CollegeSearchResult {
  college_code: number;
  college_name: string;
  district: string;
  college_type: string;
}

export function useCollegeSearch(query: string) {
  const [results, setResults] = useState<CollegeSearchResult[]>([]);
  const [loading, setLoading] = useState(false);
  const normalizedQuery = query.trim();

  useEffect(() => {
    if (!normalizedQuery) return;

    const controller = new AbortController();

    const timer = setTimeout(async () => {
      try {
        setLoading(true);

        const response = await fetch(
          `/api/colleges/search?q=${encodeURIComponent(normalizedQuery)}`,
          {
            signal: controller.signal,
          }
        );

        const json = await response.json() as {
          success?: boolean;
          data?: CollegeSearchResult[];
        };

        if (response.ok && json.success && Array.isArray(json.data)) {
          setResults(json.data);
        } else {
          setResults([]);
        }
      } catch (error) {
        if (!controller.signal.aborted && (error as Error).name !== "AbortError") {
          setResults([]);
        }
      } finally {
        if (!controller.signal.aborted) setLoading(false);
      }
    }, 300);

    return () => {
      controller.abort();
      clearTimeout(timer);
    };
  }, [normalizedQuery]);

  return {
    loading: Boolean(normalizedQuery) && loading,
    results: normalizedQuery ? results : [],
  };
}
