import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../models/category.dart';

class Taskcard extends StatelessWidget {
  final Task task;
  final List<Category> categories;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final ValueChanged<bool?>? onChanged;

  const Taskcard({
    super.key,
    required this.task,
    required this.categories,
    this.onEdit,
    this.onDelete,
    this.onChanged,
  });

  Color get priorityColor {
    switch (task.priority.toLowerCase()) {
      case 'high':
        return const Color(0xFFFF4D4D);
      case 'medium':
        return const Color(0xFFFF9F43);
      case 'low':
        return const Color(0xFF2ECC71);
      default:
        return Colors.grey;
    }
  }

  Category get category {
    return categories.firstWhere(
          (e) => e.catid == task.catid,
      orElse: () => categories.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Priority accent bar
              Container(
                width: 6,
                color: priorityColor,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Custom Checkbox
                          GestureDetector(
                            onTap: () => onChanged?.call(!task.iscompleted),
                            child: Container(
                              margin: const EdgeInsets.only(top: 2),
                              width: 24,
                              height: 24,
                              decoration: BoxDecoration(
                                color: task.iscompleted ? theme.primaryColor : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: task.iscompleted ? theme.primaryColor : Colors.grey.shade300,
                                  width: 2,
                                ),
                              ),
                              child: task.iscompleted
                                  ? const Icon(Icons.check, size: 16, color: Colors.white)
                                  : null,
                            ),
                          ),
                          const SizedBox(width: 12),
                          // Content
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  task.title,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16,
                                    color: task.iscompleted ? Colors.grey : Colors.black87,
                                    decoration: task.iscompleted ? TextDecoration.lineThrough : null,
                                  ),
                                ),
                                if (task.description.isNotEmpty) ...[
                                  const SizedBox(height: 4),
                                  Text(
                                    task.description,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 13,
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                          // Actions
                          PopupMenuButton<String>(
                            padding: EdgeInsets.zero,
                            icon: Icon(Icons.more_horiz, color: Colors.grey.shade400),
                            itemBuilder: (context) => [
                              const PopupMenuItem(
                                value: "edit",
                                child: Row(
                                  children: [
                                    Icon(Icons.edit_outlined, size: 18),
                                    SizedBox(width: 8),
                                    Text("Edit"),
                                  ],
                                ),
                              ),
                              const PopupMenuItem(
                                value: "delete",
                                child: Row(
                                  children: [
                                    Icon(Icons.delete_outline, size: 18, color: Colors.red),
                                    SizedBox(width: 8),
                                    Text("Delete", style: TextStyle(color: Colors.red)),
                                  ],
                                ),
                              ),
                            ],
                            onSelected: (value) {
                              if (value == "edit") onEdit?.call();
                              if (value == "delete") onDelete?.call();
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Bottom Info Row
                      Row(
                        children: [
                          const SizedBox(width: 36), // Offset for checkbox
                          // Category tag
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: category.color.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                FaIcon(category.catimage, size: 10, color: category.color),
                                const SizedBox(width: 6),
                                Text(
                                  category.catname,
                                  style: TextStyle(
                                    color: category.color,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          // Date & Time Tags
                          _buildInfoTag(Icons.calendar_today_outlined, task.date),
                          const SizedBox(width: 8),
                          _buildInfoTag(Icons.access_time, task.time),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTag(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: Colors.grey.shade400),
          const SizedBox(width: 4),
          Text(
            text,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}