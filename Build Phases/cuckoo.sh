if [! -z "$CI" ]; then
    OUTPUT_FILE="${PROJECT_DIR}/Unit Tests/Mocks/GeneratedMocks.swift"
    echo "Generated Mocks File = ${OUTPUT_FILE}"

    INPUT_DIR="${PROJECT_DIR}/${PROJECT_NAME}"
    echo "Mocks Input Directory = ${INPUT_DIR}"

    "Carthage/Checkouts/Cuckoo/run" --download 0.12.1 generate --testable "${PROJECT_NAME}" \
    --output "${OUTPUT_FILE}"
fi