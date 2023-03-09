<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Car>
 */
class CarFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'brand' => $this->faker->word,
            'model' => $this->faker->word,
            'reservoir' => $this->faker->randomFloat(2, 0, 100),
            'consumption' => $this->faker->randomFloat(2, 0, 100),
            'user_id' => User::factory(),
        ];
    }
}
