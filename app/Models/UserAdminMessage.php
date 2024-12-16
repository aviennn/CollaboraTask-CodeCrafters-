<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserAdminMessage extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'message',
        'file_url',
        'original_file_name',
        'parent_message_id',
    ];
    protected $casts = [
    'created_at' => 'datetime',
];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function replies()
{
    return $this->hasMany(UserAdminMessage::class, 'parent_message_id');
}
}
