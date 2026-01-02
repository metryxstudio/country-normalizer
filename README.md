# Country Normalizer

A server-side Google Tag Manager variable template that converts country names to ISO 3166-1 alpha-2 codes (lowercase) for server-side tracking. Supports 195+ countries with native language variants.

## Overview

This template converts full country names to standardized two-letter ISO codes required by advertising platforms like Facebook, Google, and TikTok. It supports English names, native language names, and common abbreviations.

## Installation

1. In your server-side GTM container, go to **Templates** → **Variable Templates** → **Search Gallery**
2. Search for "Country Normalizer"
3. Click **Add to workspace**

## Configuration

| Field | Description |
|-------|-------------|
| **Raw Country** | Country name or ISO code in its original form |

## Examples

| Input | Output |
|-------|--------|
| `Croatia` | `hr` |
| `Hrvatska` | `hr` |
| `HR` | `hr` |
| `United States` | `us` |
| `USA` | `us` |
| `Germany` | `de` |
| `Deutschland` | `de` |
| `United Kingdom` | `gb` |
| `UK` | `gb` |
| `Japan` | `jp` |
| `Atlantis` | `undefined` |

## Features

- Converts to lowercase ISO 3166-1 alpha-2 codes
- Supports 195+ UN member countries and territories
- Recognizes native language names (e.g., `Deutschland`, `Hrvatska`, `España`)
- Handles common abbreviations (e.g., `USA`, `UK`, `UAE`)
- Passes through valid 2-letter ISO codes
- Returns `undefined` for invalid or unknown countries

## Supported Regions

- All European countries (including native names)
- All Asian countries
- All African countries
- All American countries (North, Central, South)
- All Oceanian countries
- Special territories (Hong Kong, Macau, etc.)

## Usage Example

1. Create a variable using this template
2. Set **Raw Country** to your country data source (e.g., `{{Event Data - country}}`)
3. Use the normalized output in your tracking tags

## Author

**Metryx Studio**  
Website: [metryx.studio](https://metryx.studio)  
Contact: filip@metryx.studio

## License

Apache License 2.0
