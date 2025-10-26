<?php
declare(strict_types=1);

namespace BlackCat\Database\Packages\EncryptionEvents\Dto;

/**
 * Jednoduché, neměnné DTO s veřejnými readonly vlastnostmi.
 * - Bez logiky; pouze nosič dat.
 * - Silné typy drží kontrakt napříč vrstvami.
 */
final class EncryptionEventDto {
    public function __construct(
        public readonly ?int $id,
        public readonly string $entityTable,
        public readonly string $entityPk,
        public readonly string $fieldName,
        public readonly string $op,
        public readonly ?int $policyId,
        public readonly ?string $localKeyVersion,
        public readonly array|null $layers,
        public readonly string $outcome,
        public readonly ?string $errorCode,
        public readonly \DateTimeImmutable $createdAt
    ) {}

    /** Vhodné pro serializaci/logování (bez velkých blobů). */
    public function toArray(): array {
        return get_object_vars($this);
    }
}
